// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/MyToken.sol";

contract MyTokenTest is Test {
    MyToken m;

    function setUp() public {
        m = new MyToken(200);
    }

  function testMint() public {
        m.mint(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9 ,100);
        assertEq(m.balanceOf(address(this)), 100, "mint to self failed");

        address user = address(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9);
        assertEq(m.balanceOf(user), 0, "initial balance not zero");

        m.mint(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9 ,100);
        assertEq(m.balanceOf(user), 100, "mint to user failed");
    }

    function testTransfer() public {
        m.mint(address(this) , 100) ;
        m.transfer(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9 , 50);
        
        assertEq(m.balanceOf(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9), 50 , "ok");
        assertEq(m.balanceOf(address(this)) , 50 , "ok");

        vm.prank(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9);
        m.transfer(address(this) , 50 ) ;

        assertEq(m.balanceOf(address(this)), 100 , "ok");
        assertEq(m.balanceOf(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9), 0 , "ok");
    }

    function testApprovals() public {
        m.mint(address(this) , 100 ) ;
        m.approve(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9 , 50) ;

        vm.prank(0xeD5b4Dc4DA48c56E6983A584c98cBE47C123f1B9); 
        m.transferFrom(address(this) ,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 , 40 ) ;

        assertEq(m.balanceOf(address(this)), 60 , "ok" );
        assertEq(m.balanceOf(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) , 40 , "ok");
    }
}
