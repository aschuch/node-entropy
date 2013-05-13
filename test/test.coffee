entropy = require('../src/entropy')
should = require('should')

#
# Empty items
#
items = []

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  entropy.should.be.a('object')
  entropy.should.have.property('name', 0)
  entropy.should.have.property('email', 0)
  entropy.should.have.property('year', 0)

# //////////////////////////////////////

#
# empty items, empty columns
#
entropy.calculateEntropy items, [], (entropy) ->
  entropy.should.be.a('object')
  entropy.should.not.have.property('name')
  entropy.should.not.have.property('email')
  entropy.should.not.have.property('year')

# //////////////////////////////////////

#
# All equal
#
items = [
  name: "Alex"
  email: "hello@example.com"
  year: 1980
]

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  entropy.should.be.a('object')
  entropy.should.have.property('name', 0)
  entropy.should.have.property('email', 0)
  entropy.should.have.property('year', 0)

items = [
  name: "Alex"
  email: "hello@example.com"
  year: 1980
,
  name: "Alex"
  email: "hello@example.com"
  year: 1980
,
  name: "Alex"
  email: "hello@example.com"
  year: 1980
]

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  entropy.should.be.a('object')
  entropy.should.have.property('name', 0)
  entropy.should.have.property('email', 0)
  entropy.should.have.property('year', 0)

# //////////////////////////////////////

#
# All unequal
#
items = [
  name: "Alex"
  email: "hello@example.com"
  year: 1980
,
  name: "Peter"
  email: "peter@example.com"
  year: 1990
,
  name: "Bob"
  email: "bob@example.com"
  year: 2000
]

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  entropy.should.be.a('object')
  entropy.name.should.equal(entropy.email)
  entropy.name.should.equal(entropy.year)
  entropy.email.should.equal(entropy.year)

# //////////////////////////////////////

#
# Array
#
items = [
  name: "Alex"
  email: ["hello@example.com", "bob@example.com"]
  year: 1980
,
  name: "Peter"
  email: ["hello@example.com", "bob@example.com"]
  year: 1980
,
  name: "Bob"
  email: ["hello@example.com", "bob@example.com"]
  year: 1980
]

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  entropy.email.should.equal(0)

# //////////////////////////////////////

#
# All unequal
#
items = [
  name: "Alex"
  email: "hello@example.com"
  year: 1980
,
  name: "Peter"
  email: "hello@example.com"
  year: 1980
,
  name: "Bob"
  email: "bob@example.com"
  year: 1980
]

entropy.calculateEntropy items, ["name", "email", "year"], (entropy) ->
  console.log entropy

# //////////////////////////////////////

console.log "All tests OK"
