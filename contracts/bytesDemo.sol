// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

// bytes: 不定长数组字节
// bytes1 ~ bytes32: 定长数组字节
// 数组字节默认存储结构是二进制，在调试看到以十六进制表示的字节数据（例如在调试输出或日志中），但在合约内部，bytes 数据是以二进制形式存储的。
// 可以转为字符串看清晰的值

contract bytesDemo {
    bytes public bs01 = "hello world"; // 0x68656c6c6f20776f726c64

    bytes public bs02 = "h"; //  0x68

    // bytes public  bs03 = 0xee;


    bytes1 public b101 = "h";

    bytes1 public b102 = 'e';

    event BytesUpdated(bytes newBytes);

    // 在remix左侧手动调用编译部署后的函数时, 需要传递16进制数据， 如 0x4546
    function set_bs01(bytes memory _bs) public {
        bs01 = _bs;
         emit BytesUpdated(bs01); // 触发事件以调试
    }

    // 获取字节数组的长度
    function getbsLen() public view returns (uint){
        return bs01.length;
    }

    function bytes_to_string() public view returns (string memory){
        return string(bs01);
    }

}