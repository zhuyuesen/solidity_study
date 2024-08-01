
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 接口：
// 接口类似于抽象合约，但它不实现任何功能。接口的规则：
// 不能包含状态变量
// 不能包含构造函数
// 不能继承除接口外的其他合约
// 所有函数都必须是external且不能有函数体
// 继承接口的非抽象合约必须实现接口定义的所有功能

interface Base1 {
    function getFirstName() external pure returns (string memory);
    function getLastName() external  pure returns (string memory);
}

contract BaseImpl1 is Base1{
    function getFirstName() external pure override returns (string memory){
        return "jack";
    }
    function getLastName() external  pure override  returns (string memory){
        return "zhang";
    }
}