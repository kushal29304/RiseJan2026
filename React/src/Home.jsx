import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';

const Home = () => {
    const [count, setCount] = useState(0);
    const [loading, setLoading] = useState(false);
    const [message, setMessage] = useState('');
    const navigate = useNavigate();

    const handleIncrement = () => setCount((prev) => prev + 1);
    const handleDecrement = () => setCount((prev) => prev - 1);
    const handleReset = () => setCount(0);

    const handleNavigateAbout = () => {
        navigate('/about');
    };

    const handleNavigateBlog = () => {
        navigate('/blog');
    };

    const loadWelcomeMessage = async () => {
        setLoading(true);
        setMessage('');

        try {
            const response = await fetch('https://jsonplaceholder.typicode.com/posts/1');

            if (!response.ok) {
                throw new Error('Failed to fetch welcome message.');
            }

            const data = await response.json();
            setMessage(data.title);
        } catch (error) {
            setMessage(error.message || 'Something went wrong while loading data.');
        } finally {
            setLoading(false);
        }
    };

    return (
        <div>
            <h1>Welcome to the Home Page</h1>
            <p>This is the main landing page.</p>

            <h2>Counter: {count}</h2>
            <button onClick={handleIncrement}>Increment</button>
            <button onClick={handleDecrement}>Decrement</button>
            <button onClick={handleReset}>Reset</button>

            <div style={{ marginTop: '16px' }}>
                <Link to="/about">About</Link>
                <br />
                <Link to="/blog">Blog</Link>
            </div>

            <div style={{ marginTop: '16px' }}>
                <button onClick={handleNavigateAbout}>Go to About</button>
                <button onClick={handleNavigateBlog}>Go to Blog</button>
            </div>

            <div style={{ marginTop: '16px' }}>
                <button onClick={loadWelcomeMessage} disabled={loading}>
                    {loading ? 'Loading...' : 'Load Welcome Message'}
                </button>
                {message && <p>{message}</p>}
            </div>
        </div>
    );
}

export default Home;