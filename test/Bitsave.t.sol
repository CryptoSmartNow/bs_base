// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bitsave} from "../src/Bitsave.sol";
import {BitsaveConfigs} from "../src/Config.sol";
import {ChildBitsave} from "../src/ChildContract.sol";


contract BitsaveTest is Test, BitsaveConfigs {
    Bitsave public bitsave;
    ChildBitsave public childBitsave;

    constructor() {
        bitsave = new Bitsave(stableCoin, csToken);
        console.log(bitsave.masterAddress(), address(this));
    }

    function setUp() public {
    }

    function test_SetStableCoin() public {
        assertEq(address(bitsave.stableCoin()), stableCoin);
    }

    function test_SetCSToken() public {
        assertEq(address(bitsave.csToken()), csToken);
    }

    function test_SetMasterAddr() public {
        assertEq(address(bitsave.masterAddress()), address(this));
    }


    // function test_Increment() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testFuzz_SetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
