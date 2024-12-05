// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

contract GasTest{
    uint256 public i= 1;

    event log(uint256 val);

    function forever() public {
        while (true){
            i += 1;
            emit log(i);
        }
    }
}