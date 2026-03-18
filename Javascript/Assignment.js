//1. Assignment

let name = "Suresh";
let age = 65;
let purchaseAmount = 6000;

let discount = 0;

// Age-based discount
if (age < 18) {
    discount += 10;
} else if (age >= 60) {
    discount += 20;
}

// Purchase-based discount
if (purchaseAmount > 5000) {
    discount += 5;
}

// Final amount calculation
let finalAmount = purchaseAmount - (purchaseAmount * discount / 100);

// Output
console.log(`Hi ${name}! You received a total discount of ${discount}%. Final amount: ₹${finalAmount}`);

// Assignment 2

let correctUsername = "admin";
let correctPassword = "1234";

let enteredUsername = "admin";
let enteredPassword = "1234";

if (enteredUsername === correctUsername && enteredPassword === correctPassword) {
    console.log("Login successful!");
} 
else if (enteredUsername !== correctUsername && enteredPassword !== correctPassword) {
    console.log("Both incorrect");
} 
else if (enteredUsername !== correctUsername) {
    console.log("Incorrect username");
} 
else {
    console.log("Incorrect password");
}

// Assignment 3

let num = -4;

// Positive, Negative, or Zero
let type;
if (num > 0) {
    type = "positive";
} else if (num < 0) {
    type = "negative";
} else {
    type = "zero";
}

// Even or Odd
let parity = (num % 2 === 0) ? "even" : "odd";

// Output
console.log(`The number ${num} is ${type} and ${parity}.`);

// Assignment 4

let isMember = true;
let cartValue = 1200;

if ((isMember && cartValue > 1000) || cartValue > 2000) {
    console.log("You are eligible for free delivery!");
} else {
    console.log("You are not eligible for free delivery.");
}

// Assignment 5 

let marks = 82;

if (marks < 0 || marks > 100) {
    console.log("Invalid marks entered.");
} 
else if (marks >= 90) {
    console.log("Your grade is A.");
} 
else if (marks >= 75) {
    console.log("Your grade is B.");
} 
else if (marks >= 50) {
    console.log("Your grade is C.");
} 
else {
    console.log("Fail");
}