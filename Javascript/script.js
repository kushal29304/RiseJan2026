'use strict';
// let myPreviousjob = 'Software Engineer';
// let myCurrentjob = 'Data Scientist';
// console.log(myPreviousjob);
// console.log(myCurrentjob);
// console.log(10 + null);

// Datatypes in JavaScript
// Number, String, Boolean, Null, Undefined, Symbol
// let age = 22;
// console.log(typeof age);
// let year = 20.5;
// console.log(typeof year);

//Operators
// let current = 2026
// let ageSuresh = 2026 - 1990
// let ageRamesh = 2026 - 1995

// console.log(ageSuresh, ageRamesh);

// let x = 10 + 5
// x += 10;
// x++;

//Literals
//String - uses + and self declaration
//String literal - they use backtick and without any operator
// const firstName = 'Suresh';
// const year = 2010;
// const birthYear = 1990;
// console.log("I'm " + firstName + ", and I'm " + (year - birthYear) + " years old.");
// console.log(`I'm ${firstName}, and I'm ${year - birthYear} years old.`);

// const age = 17;
// if( age >= 18){
//     console.log('You are eligible to vote');
// }
// else if(age > 80){
//     console.log('You are too old to vote');
// }
// else{
//     console.log('You are not eligible to vote');
// }

// //Type conversion
// const year = 'TwentyTen';
// console.log(Number(year));
// console.log(typeof NaN);

//Type coercion
//String + Number = String
// console.log('I am ' + 23 + ' years old');
// console.log('23' - '10' - 'years');

// let n = '1' + 1;
// console.log(n);

//console.log( 2 + 3 + 4 - '5');

// falsy values 0, NULL, NaN, undefined, ''
// console.log(Boolean(0));
// console.log(Boolean(undefined));
// console.log(Boolean(''));
// console.log(Boolean('Suresh'));
// console.log(Boolean(null));

// const money = 1000;
// if (money>500) {
//     console.log("Don't spend it all");
// }
// else if(money < 100 && money > 50){
//     console.log('You can spend it');
// }
// else {
//     console.log('You should get a job');
// }

// Strict quality === vs Loose quality ==

//let money = 100;
// if(money == 100){
//     console.log('You have 100 rupees');
// }

// if(money === 100){
//     console.log('This message is for Strict quality check');
// }


// Ternary operator ?(if) :(else) 

// const score = 80;

// const result = score > 70 ? 'Great job!' : 'You can do better!';
// console.log(result);

// let result1;
// if(score > 70){
//     result1 = 'Great job!';
// }
// else{
//     result1 = 'You can do better!';
// }
// console.log(result1);

// Logical operators &&, ||, !

// const givenProgrammingAssess = true;
// const givenDBAssess = false;

// console.log(givenProgrammingAssess || givenDBAssess);
// console.log(!givenDBAssess);

// if(givenProgrammingAssess || givenDBAssess){
//     console.log('Assessment Submitted');
// }
// else {
//     console.log('Assessment is pending');
// }

// Function
// function greetings(){
//     console.log('Good Morning');
// }

// greetings();

// Parameters and Arguments
// function greetings(name = 'there') //Variable inside a function
// {
//     console.log('Hello ' + name);
// }
// greetings('Suresh'); //Argument passed to the function

// function add(a,b){
//     return a + b;
// }

// let sum = add(5, 10);
// console.log(sum);

// function greetings(firstName, Lastname){
//     console.log('Hello ' + firstName + ' ' + Lastname);
// }
// greetings('Kushal');

