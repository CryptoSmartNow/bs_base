// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bitsave} from "../src/Bitsave.sol";
import {ChildBitsave} from "../src/ChildContract.sol";

abstract contract BitsaveSetup {
    address stableCoin = address(0x05D032ac25d322df992303dCa074EE7392C117b9);
    address csToken = address(0x05D032ac25d322df992303dCa074EE7392C117b9);
    uint256 joinFee = 0.01 ether;

    // some users
    address userWJoined = address(1);
    address userNJoined = address(2);
    address userRandom = address(3);
}


contract BitsaveTest is Test, BitsaveSetup {
    Bitsave public bitsave;
    ChildBitsave public childBitsave;

    constructor() {
        bitsave = new Bitsave(stableCoin, csToken);
        vm.deal(userWJoined, 1 ether);
    }

    function setUp() public {
        vm.deal(userWJoined, 1 ether);
        bitsave.joinBitsave{value: joinFee}();
    }

    function test_CreateSaving() public {
        assertNotEq(bitsave.getUserChildContractAddress(), address(0));
    }
}