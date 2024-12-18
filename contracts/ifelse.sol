// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

// if else && 三元运算符

contract Ifelse {
    function foo(uint256 x) public pure returns (uint256){
        if(x < 10) return 0;
        else if(x<20) return 1;
        else return 2;
    }

    function ternary(uint256 _x) public pure returns (uint256){
        return _x < 10 ? 1 : 2;
    }
}