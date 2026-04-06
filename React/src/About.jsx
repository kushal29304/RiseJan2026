import { Link, useNavigate } from 'react-router-dom';

const About = () => {
	const navigate = useNavigate();

	return (
		<div>
			<h1>About Page</h1>
			<p>This is the About page content.</p>
			<Link to="/blog">Go to Blog</Link>
			<br />
			<button onClick={() => navigate('/')}>Go to Home</button>
		</div>
	);
};

export default About;
