var myArr = [1,2,43,5,6,4,32,7,5];
var myObj = {x:1,y:3,z:4,q:5};

{
    let{x,y,z} = myObj;
    console.log(y);
}

for (let i of myObj){
    console.log(i)
}

function hey(){
    var x = 10;
}

hey();
console.log(x);

function adder(x){
    return function(y){
        return x+y;
    }
}

var add5 = adder(5);
console.log(add5(7))
console.log(add5(8))
console.log(add5(5))

var count = (function (){
    var counter = 0;
    return function(){
        counter +=1;
        console.log(counter)
        return counter
    }
})();

count()
console.log(counter)

count()
console.log(counter)

count()
console.log(counter)



count();
count();
count();
