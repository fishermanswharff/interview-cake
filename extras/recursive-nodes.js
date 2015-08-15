var node = {
  "name": "node 1",
  "children": [
    {
      "name": "node 2",
      "children": [
        {
          "name": "node 4",
          "children": [
            {
              "name": "name 5",
              "children": []
            },
            {
              "name": "name 6",
              "children": []
            }
          ]
        }
      ]
    },
    {
      "name": "node 3",
      "children": []
    }
  ]
};

var names = [];

var getNames = function(node){
  names.push(node.name);
  for(var i = 0; i < node.children.length; i++){
    getNames(node.children[i]);
  }
};

getNames(node);
console.log(names);