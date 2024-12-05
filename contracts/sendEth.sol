    // SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract ReceiveETH {
    // 收到eth事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    // receive方法，接收eth时被触发
    // gasleft() 返回当前执行上下文中剩余的 gas 量
    receive() external payable{
        emit Log(msg.value, gasleft());
    }
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}

contract sendEth{
    // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable {}
    // receive方法，接收eth时被触发
    receive() external payable { }

    // 用transfer()发送ETH
    function transferETH(address payable _to, uint256 amount) external payable{
        _to.transfer(amount);
    }
     // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    // 用send发送
    // error sendFailed();

    // function sendETH(address payable _to, uint256 amount) external payable {
    //     bool success = _to.send(amount);
    //     if(!success){
    //         revert sendFailed();
    //     }
    // }

    error SendFailed(); // 用send发送ETH失败error

    // send()发送ETH
    function sendETH(address payable _to, uint256 amount) external payable{
        // 处理下send的返回值，如果失败，revert交易并发送error
        bool success = _to.send(amount);
        if(!success){
            revert SendFailed();
        }
    }
}