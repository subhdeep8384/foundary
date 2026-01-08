// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MyToken is ERC20 {
    address public  owner ; 
    constructor(uint _initialTokenAmount ) ERC20("MyToken", "MTK") {
        owner = msg.sender ;
        require(_initialTokenAmount > 0 , "Initial token amount should be greater than 0");
        require(msg.sender == owner , "Only owner of the contract can mint tokens");
        _mint(msg.sender , _initialTokenAmount) ;
    }

    function mint(address _to  ,uint _amount ) public {
        require(msg.sender == owner , "Only owner of the contract can mint tokens");
        _mint(_to , _amount) ;
    }
} 