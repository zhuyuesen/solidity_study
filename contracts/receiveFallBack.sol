    // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 接收ETH rcceive 和 fallback 函数

/**
    回退函数 fallback
    fallback()函数会在调用合约不存在的函数时被触发。
*/

contract receiveFallBack{
    // 定义事件
    event received(address Sender, uint value);

    // 接收ETH时释放事件
    receive() external payable { 
        emit received(msg.sender, msg.value);
    }

    event fallbackCalled(address Sender, uint Value, bytes Data);
    // fallback
    fallback() external payable{
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }

}
