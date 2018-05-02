// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;

string LOREM_ONE = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

string LOREM_TWO = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est different.";

@test:Config
function testLevenshtein() {
    test:assertEquals(calculateLevenshteinDistance("this is one", "this is two"), 3, msg = "Levenshtein distance fails");
}

@test:Config
function testLevenshteinLong() {
    test:assertEquals(calculateLevenshteinDistance(LOREM_ONE, LOREM_TWO), 8, msg = "Levenshtein distance fails");
}

@test:Config
function testHamming() {
    test:assertEquals(calculateHammingDistance("", ""), 0, msg = "hamming distance failes");
    test:assertEquals(calculateHammingDistance("a", ""), -1, msg = "hamming distance failes");
    test:assertEquals(calculateHammingDistance("karolin", "kathrin"), 3, msg = "hamming distance failes");
}
