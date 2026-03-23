
//1st question
let students = [
  { name: "Kushal", marks: [80, 70, 90] },
  { name: "Simran", marks: [50, 45, 60] },
  { name: "Happy", marks: [30, 40, 35] }
];

let result = students.map(student => {
  let total = student.marks.reduce((sum, m) => sum + m, 0);
  let avg = total / student.marks.length;

  let grade = "";
  if (avg >= 75) grade = "Distinction";
  else if (avg >= 50) grade = "Pass";
  else grade = "Fail";

  return {
    ...student,
    average: avg,
    result: grade
  };
});

console.log(result);

//2nd question

function cartAnalyzer(...items) {
  let totalAmount = 0;
  let totalQuantity = 0;

  items.forEach(item => {
    totalAmount += item.price * item.quantity;
    totalQuantity += item.quantity;
  });

  return {
    totalAmount,
    totalQuantity
  };
}

let output = cartAnalyzer(
  { name: "Shirt", price: 500, quantity: 2 },
  { name: "Shoes", price: 1000, quantity: 1 }
);

console.log(output);

//3rd question
function updateUser(user) {
  let updatedUser = {
    ...user,
    city: "Mumbai",
    profession: "Developer"
  };

  return updatedUser;
}

let user1 = {
  name: "Kushal",
  city: "Surat"
};

let newUser = updateUser(user1);

console.log("Original:", user1);
console.log("Updated:", newUser);

//4th question

let products = [
  { name: "Laptop", price: 50000 },
  { name: "Mouse", price: 500 },
  { name: "Phone", price: 20000 }
];

let updatedProducts = products
  .filter(p => p.price > 1000)
  .map(p => {
    return {
      ...p,
      discountedPrice: p.price * 0.9
    };
  });

console.log(updatedProducts);

//5th question

let numbers = [1, 2, 3, 4, 5, 6];

let even = [];
let odd = [];
let evenSum = 0;
let oddSum = 0;

numbers.forEach(num => {
  if (num % 2 === 0) {
    even.push(num);
    evenSum += num;
  } else {
    odd.push(num);
    oddSum += num;
  }
});

console.log("Even Numbers:", even);
console.log("Odd Numbers:", odd);
console.log("Sum of Even:", evenSum);
console.log("Sum of Odd:", oddSum);