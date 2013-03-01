# Node Shannon Entropy

[Shannon entropy](http://en.wikipedia.org/wiki/Entropy_(information_theory) calculation to measure the information gain of an array of objects (i.e. average unpredictability in a random variable) in bits.

The algorithm is based on the equation

![equation](http://schuch.me/github/node-entropy/entropy_equation.png "Shannon Entropy Equation")

## Installation

```bash
$ npm install shannon-entropy
```

## Usage

```javascript
var entropy = require('shannon-entropy');
entropy.calculateEntropy(items, columns, function(entropy) {
	console.log(entropy);
});
```

```items``` is an array of objects on which the entropy algorithm is performed. The ```columns``` array includes all the keys of the object the entropy should be calculated of. The callback returns an object containing each key defined in the ```columns``` array and the value of the calculated entropy in bits.

### Example

```javascript
var entropy = require('shannon-entropy');
  
var items = [
	{
    	name: "Alex",
   		email: "hello@example.com",
   		year: 1980
    }, 
    {
    	name: "Peter",
      	email: "peter@example.com",
      	year: 1990
    }, {
      	name: "Bob",
      	email: "bob@example.com",
      	year: 2000
    }
];

var columns = ["name", "email", "year"];

entropy.calculateEntropy(items, columns, function(entropy) {
	console.log(entropy);
});
```

#### Output

The entropy of each property in bits.

```javascript
{ 
	name: 4.754887502163468, 
	email: 2.7548875021634687, 
	year: 0 
}
```

## Tests

```bash
$ npm test

{ name: 4.754887502163468, email: 2.7548875021634687, year: 0 }
All tests OK
```

## Contributing

* Create something awesome, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)

## Contact

Feel free to get in touch.

* Website: <http://schuch.me> 
* Twitter: [@schuchalexander](http://twitter.com/schuchalexander)

## Licence

Copyright (C) 2013 Alexander Schuch

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.