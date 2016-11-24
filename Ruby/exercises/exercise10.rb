# Can hash values be arrays? Can you have an array of hashes? (give examples)

# Answer:
# Yes and Yes

hash_of_arrays = {
  names: ["Colton", "Valerie"],
  ages: [21, 18]
}

array_of_hashes = [
  {
    name: "Colton",
    age: 21
  },
  {
    name: "Valerie",
    age: 18
  }
]

p hash_of_arrays, array_of_hashes
