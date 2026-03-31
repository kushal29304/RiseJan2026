import React from 'react';
import Header from './Header';
const App = () => {
  const [ count, setCount ] = React.useState(0);

  const handleIncrease = () => {
    setCount(count + 1);
  };

  const handleDecrease = () => {
    setCount(count - 1);
  };
  const handleAlert = () => {
    alert('Button clicked!');
  };
  return (
    <div>
      <h1>Hello, World!</h1>
      <p>This is a simple React application.</p>
      <button onClick={handleIncrease}>Increase</button>
      <p>Count: {count}</p>
      <button onClick={handleDecrease}>Decrease</button>
      <button onClick={handleAlert}>Alert</button>
      <Header name="Kushal" age={25} />
      <Footer name = "Kushal" place="Gujarat"></Footer>
    </div>
  );
}

export default App

// Count with three buttons below it to increase, decrease and reset the value, below this User name:, User age:, User city:
