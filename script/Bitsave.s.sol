// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Bitsave} from "../src/Bitsave.sol";
import {BitsaveConfigs} from "../src/Config.sol";

contract BitsaveScript is Script, BitsaveConfigs {
    Bitsave public bitsave;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        bitsave = new Bitsave(stableCoin, csToken);

        vm.stopBroadcast();
    }
}
