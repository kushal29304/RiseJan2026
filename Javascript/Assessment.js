//1. Write a function that merges two objects using the Spread Operator.
function merge(obj1, obj2) {
    return { ...obj1, ...obj2 };
}
const firstObject = { name: "Kushal", age: 21 };
const secondObject = { city: "Vadodara", age: 28 };

const mergedObj = merge(firstObject, secondObject);
console.log(mergedObj);

//2. Given an array of transaction objects [{amt: 100, type: 'deposit'}, {amt: 50, type: 'withdrawal'}], calculate the final balance in a single line.

const transactions = [{ amt: 100, type: 'deposit' }, { amt: 50, type: 'withdrawal' }];
const finalBalance = transactions.reduce((balance, transaction) => {
    return transaction.type === 'deposit' ? balance + transaction.amt : balance - transaction.amt;
}, 0);
console.log(finalBalance);

//3. Write a function that can take any number of numerical arguments and returns their total sum.
function sumNumbers(...numbers) {
    return numbers.reduce((total, number) => total + number, 0);
}
console.log(sumNumbers(10, 20, 30));

//4. Create a class Vehicle with a constructor for brand. Create a sub-class Car that adds a model property and a method displayInfo() that logs both.
class Vehicle {
    constructor(brand) {
        this.brand = brand;
    }
}
class Car extends Vehicle {
    constructor(brand, model) {
        super(brand);
        this.model = model;
    }
    displayInfo() {
        console.log("Brand: " + this.brand + ", Modelname: " + this.model);
    }
}
const myDream = new Car('BMW', 'M5');
myDream.displayInfo();

// 5.Create a function timeoutPromise(ms) that returns a promise which rejects after ms milliseconds.
//  Use Promise.race to stop a fetch request if it takes longer than 5 seconds.
function timeoutPromise(ms) {
	return new Promise((_, reject) => {
		setTimeout(() => {
			reject(new Error("Request timed out"));
		}, ms);
	});
}

const fetchWithTimeout = (url) => {
	return Promise.race([
		fetch(url),
		timeoutPromise(5000)
	]);
}
fetchWithTimeout('https://jsonplaceholder.typicode.com/posts/1')
	.then(response => response.json())
	.then(data => console.log(data))
	.catch(error => console.error(error));

	





