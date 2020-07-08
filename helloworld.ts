import { argv } from 'process'

const greet = (name: string): string => `Hello ${name}!`

const greeting = greet(argv.length > 2 ? argv[2] : 'unknown person')

console.log(greeting)
