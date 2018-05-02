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

function min(int a, int b) returns int {
    if (a < b) {
        return a;
    }
    return b;
}

function max(int a, int b) returns int {
    if (a < b) {
        return b;
    }
    return a;
}

documentation{
    Calculate levenshtein distance between two strings

    P{{lhs}} string one
    P{{rhs}} string two
    R{{}} Returns distance as an integer
}
public function calculateLevenshteinDistance(string lhs, string rhs) returns int {
    int len0 = lhs.length() + 1;
    int len1 = rhs.length() + 1;

    // the array of distances
    int[] cost;
    int[] newcost;

    // initial cost of skipping prefix in String s0
    foreach i in [0..len0 - 1] {
        cost[i] = i;
    }

    // dynamically computing the array of distances

    // transformation cost for each letter in s1
    foreach j in [1..len1 - 1] {
        // initial cost of skipping prefix in String s1
        newcost[0] = j;

        // transformation cost for each letter in s0
        foreach i in [1..len0 - 1] {
            // matching current letters in both strings
            int m = (lhs.substring(i - 1, i) == rhs.substring(j - 1, j)) ? 0 : 1;

            // computing cost for each transformation
            int cost_replace = cost[i - 1] + m;
            int cost_insert = cost[i] + 1;
            int cost_delete = newcost[i - 1] + 1;

            // keep minimum cost
            newcost[i] = min(min(cost_insert, cost_delete), cost_replace);
        }

        // swap cost/newcost arrays
        int[] swap = cost;
        cost = newcost;
        newcost = swap;
    }

    // the distance is the cost for transforming all letters in both strings
    return cost[len0 - 1];
}

documentation{
    Calculate hamming distance between two strings of same length

    P{{a}} string one
    P{{b}} string two
    R{{}} Returns distance as an integer. Returns -1 if the strings are not in the same size.
}
public function calculateHammingDistance(string a, string b) returns int {
    //Hamming distance is defined only for strings of same size
    if (a.length() != b.length()) {
        return -1;
    }
    int sum = 0;
    foreach i in [0..a.length() - 1] {
        if (a.substring(i, i + 1) != b.substring(i, i + 1)){
            sum += 1;
        }
    }
    return sum;
}