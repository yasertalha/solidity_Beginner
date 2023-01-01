//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import {Poly} from "./polymorphism.sol";

contract Book {
    uint256 length;

    function getLength() external view returns (uint256) {
        return length;
    }

    function setLength(uint256 _len) external {
        length = _len;
    }
}

contract Book1 {
    Book mybook = new Book();
    Poly myPoly = new Poly();

    function a() external view returns (uint256) {
        return mybook.getLength();
    }

    function aPoly(uint256 _a, uint256 _b) external view returns (uint256) {
        return myPoly.add(_a, _b);
    }
}
