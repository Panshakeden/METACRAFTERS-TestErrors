// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract testError {

    address public owner;
    uint256 public num;


    constructor() {
        owner=msg.sender;
    }

    function setNum(uint256 _num) public {
        onlyOwner();

        assert(_num > 0);
        num=_num;
    }

  

    function testRevert() public view  {
        onlyOwner();

        if (num <= 10) {
            revert("Input must be greater than 10");
        }
    }


    function onlyOwner() private  view{
        require(owner==msg.sender," you can't have access!");
    }


}