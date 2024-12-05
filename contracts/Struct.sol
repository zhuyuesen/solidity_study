// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

// Struct 结构体

contract Struct{
    struct Todo{
        string text;
        bool compoluted;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text, false));
    }

    function get(uint256 _index) public view returns (string memory text, bool computed){
        Todo storage todo = todos[_index];
        return (todo.text, todo.compoluted);
    }

    function h(uint256[] calldata _arr) public pure returns (uint256[] calldata){
        return  _arr;
    }

}