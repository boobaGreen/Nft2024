// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testCovertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQwIiB3aWR0aD0iMjAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjx0ZXh0IHg9IjUiIHk9IjMwIiBmaWxsPSJub25lIiBzdHJva2U9InJlZCIgZm9udC1zaXplPSIzNSI+SSBsb3ZlIFNWRyE8L3RleHQ+PC9zdmc+";
        string
            memory svg = '<svg height="40" width="200" xmlns="http://www.w3.org/2000/svg"><text x="5" y="30" fill="none" stroke="red" font-size="35">I love SVG!</text></svg>';
        string memory actualUri = deployer.svgToImageURI(svg);
        console.log("expectedUri: ", expectedUri);
        console.log("actualUri: ", actualUri);
        assert(
            keccak256(abi.encodePacked(expectedUri)) ==
                keccak256(abi.encodePacked(actualUri))
        );
    }
}
