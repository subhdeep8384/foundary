// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Contract { 
    string public name ;
    uint public number ;
    constructor(string memory _name , uint _number) {
        name = _name ;
        number = _number ;
    }

    function getName() public view returns(string memory ){
        return name ; 
    }

    function getNumber() public view returns ( uint ){
        return number + 2000 ;
    }

    function increment() public {
        number += 1 ;
    }
    function decrement() public {
        number -- ;
    }
}

