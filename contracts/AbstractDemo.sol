// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 抽象合约和接口

// 抽象合约：如果一个智能合约里至少有一个未实现的函数，即某个函数缺少主体{}中的内容，则必须将该合约标为abstract，不然编译会报错；另外，未实现的函数需要加virtual，以便子合约重写。
abstract contract InsertionSort {
    function insertionSort(uint[] memory a) public pure virtual  returns (uint[] memory);
}

abstract contract Base{
    string public name = "Base";
    function getAlias() public pure virtual returns (string memory);
}

contract BaseImpl is Base{
    function getAlias() public pure override returns (string memory) {
        return "BaseImpl";
    }
}
