import { Link, useNavigate } from 'react-router-dom';

const Blog = () => {
	const navigate = useNavigate();

	return (
		<div>
			<h1>Blog Page</h1>
			<p>This is the Blog page content.</p>
			<Link to="/about">Go to About</Link>
			<br />
			<button onClick={() => navigate('/')}>Go to Home</button>
		</div>
	);
};

export default Blog;
