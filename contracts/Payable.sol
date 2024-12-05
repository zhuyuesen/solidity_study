// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

contract Payable {
    address payable public owner;
    uint public amount; // 合约的余额, 在 Solidity 中，合约的余额不会自动更新到任何状态变量。在有更新余额的操作(如转账、提现)后，需要手动调用amount = address(this).balance; 更新

    // deploy时， VALUE中值作为合约余额参数
    constructor() payable {
        owner = payable(msg.sender);
        amount = address(this).balance;
    }

    // 存钱(向合约转入) 在remix中 调用deposit时， VALUE中输入值即可把值转入合约余额
     function deposit() public payable {
        amount = address(this).balance; // 更新变量显示
     }

    // 提现 - 把当前合约余额转到合约所有者owner账户中
    function widthDraw() public {
        // uint _amount = address(this).balance;
        // 将以太币发送给合约的所有者，但在执行后，合约的余额会减少。然而，amount 变量不会自动更新，因此您需要显式地更新它。
        (bool success, ) = owner.call{value:amount}(""); 
        require(success, "filed to send Ether");
        amount = address(this).balance;
    }

    // 向参数地址转钱 - 从当前合约地址转出
    function transfer(address payable _to, uint _amount) public {
         (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
        amount = address(this).balance;
    }

}

/**
1. depoly 时， VALUE输入的值会付给合约的 amount， ACCOUNT默认值会赋给 owner
2. deploy 上的 VALUE 输入框：
    在 Remix 中，deploy 上的 VALUE 输入框用于指定在部署合约时要发送的以太币数量。以下是它的生效和调用时机的说明：
    部署合约时：
    当您在 Remix 中选择合约并填写 VALUE 输入框时，这个值会在合约部署时发送给合约。
    例如，如果您在 VALUE 输入框中输入 1 ETH，那么在合约被部署时，合约的初始余额将是 1 ETH。
    调用合约函数时：
    VALUE 输入框仅在部署合约时生效。对于后续调用合约的函数（如 deposit 或 withdraw），您需要在函数调用时单独指定以太币的发送。
    如果您调用 deposit 函数，您需要在 Remix 的界面中输入要发送的以太币数量，才能使该函数生效。
    总结：
    VALUE 输入框在合约部署时生效，决定合约的初始余额。
    对于合约中其他可接收以太币的函数（如 deposit），需要在调用时指定具体的以太币数量。
    因此，合约的初始余额是由部署时的 VALUE 输入框决定的，而后续的以太币交互则需要在相应函数调用时进行指定。
*/