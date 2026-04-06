
import { Routes, Route } from 'react-router-dom';
import Home from './Home';
import About from './About';
import Blog from './Blog';

const App = () => {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/about" element={<About />} />
      <Route path="/blog" element={<Blog />} />
    </Routes>
  );
}
export default App;

// const App = () => {
//   const [ count, setCount ] = React.useState(0);

//   const handleIncrease = () => {
//     setCount(count + 1);
//   };

//   const handleDecrease = () => {
//     setCount(count - 1);
//   };

//   const handleReset = () => {
//     setCount(0);
//   };

//   const user = {
//     name: 'Kushal',
//     age: 25,
//     city: 'Gujarat'
//   };

//   return (
//     <div>
//       <h1>Hello, World!</h1>
//       <p>This is a simple React application.</p>
//       <p>Count: {count}</p>
//       <button onClick={handleIncrease}>Increase</button>
//       <button onClick={handleDecrease}>Decrease</button>
//       <button onClick={handleReset}>Reset</button>

//       <p>User name: {user.name}</p>
//       <p>User age: {user.age}</p>
//       <p>User city: {user.city}</p>

//       <Header name={user.name} age={user.age} />
//       <Footer name={user.name} place={user.city}></Footer>
//       <UserData />
//     </div>
//   );
// }

// export default App

// Count with three buttons below it to increase, decrease and reset the value, below this User name:, User age:, User city:
