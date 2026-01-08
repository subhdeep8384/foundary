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
    }
}
