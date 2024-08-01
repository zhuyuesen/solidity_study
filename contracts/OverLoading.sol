    // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// overloading 函数重载

contract OverLoading {
    function saySomthing() public pure returns (string memory) {
        return "nothing 666";
    }

    function saySomthing(string memory somthing) public pure returns (string memory) {
        return somthing;
    }

    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }
}
