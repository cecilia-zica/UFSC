/*Exercicio 1 */
const calculadora = (a, b, f) => {
    return f(a,b);
}
const soma = (a,b) {
    return a + b;
}
const subtrai = (a, b) =>  a - b;

console.log(calculadora(5, 3, soma));
console.log(calculadora(5, 3, subtrai));

/*Exercicio 2 */
var callback = function() {
    console.log("Estou na função de callback");
}    
console.log("Iniciei")
setTimeout(callback, 5000);
console.log("Estou após o setTimeout")
