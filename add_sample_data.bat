@echo off
echo ========================================
echo 🎯 Adding Sample DSA Problems
echo ========================================
echo.

echo This script will add some sample problems to your DSA Tracker
echo so you can see the UI in action immediately!
echo.

set API_URL=http://localhost:8080/problems

echo ➕ Adding "Two Sum" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Two Sum\",\"topic\":\"Array\",\"difficulty\":\"EASY\",\"status\":\"SOLVED\",\"description\":\"Find two numbers in an array that add up to a target sum.\",\"link\":\"https://leetcode.com/problems/two-sum/\",\"code\":\"public int[] twoSum(int[] nums, int target) {\n    Map<Integer, Integer> map = new HashMap<>();\n    for (int i = 0; i < nums.length; i++) {\n        int complement = target - nums[i];\n        if (map.containsKey(complement)) {\n            return new int[] { map.get(complement), i };\n        }\n        map.put(nums[i], i);\n    }\n    return new int[0];\n}\",\"notes\":\"Use HashMap to store indices. Time: O(n), Space: O(n)\",\"mistakes\":\"Don't forget to handle negative numbers and duplicates\"}" >nul

echo ➕ Adding "Valid Parentheses" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Valid Parentheses\",\"topic\":\"Stack\",\"difficulty\":\"EASY\",\"status\":\"SOLVED\",\"description\":\"Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.\",\"link\":\"https://leetcode.com/problems/valid-parentheses/\",\"code\":\"public boolean isValid(String s) {\n    Stack<Character> stack = new Stack<>();\n    for (char c : s.toCharArray()) {\n        if (c == '(' || c == '{' || c == '[') {\n            stack.push(c);\n        } else {\n            if (stack.isEmpty()) return false;\n            char top = stack.pop();\n            if ((c == ')' && top != '(') ||\n                (c == '}' && top != '{') ||\n                (c == ']' && top != '[')) {\n                return false;\n            }\n        }\n    }\n    return stack.isEmpty();\n}\",\"notes\":\"Use stack to match opening and closing brackets\",\"mistakes\":\"Check for empty stack before popping\"}" >nul

echo ➕ Adding "Merge Two Sorted Lists" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Merge Two Sorted Lists\",\"topic\":\"Linked List\",\"difficulty\":\"EASY\",\"status\":\"NOT_SOLVED\",\"description\":\"Merge two sorted linked lists and return it as a sorted list.\",\"link\":\"https://leetcode.com/problems/merge-two-sorted-lists/\",\"notes\":\"Can be done iteratively or recursively\",\"mistakes\":\"Handle null lists properly\"}" >nul

echo ➕ Adding "Maximum Subarray" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Maximum Subarray\",\"topic\":\"Dynamic Programming\",\"difficulty\":\"MEDIUM\",\"status\":\"REVISION\",\"description\":\"Given an integer array nums, find the contiguous subarray with the largest sum.\",\"link\":\"https://leetcode.com/problems/maximum-subarray/\",\"code\":\"public int maxSubArray(int[] nums) {\n    int maxSoFar = nums[0];\n    int maxEndingHere = nums[0];\n    for (int i = 1; i < nums.length; i++) {\n        maxEndingHere = Math.max(nums[i], maxEndingHere + nums[i]);\n        maxSoFar = Math.max(maxSoFar, maxEndingHere);\n    }\n    return maxSoFar;\n}\",\"notes\":\"Kadane's algorithm - keep track of current max and global max\",\"mistakes\":\"Initialize both variables to first element\"}" >nul

echo ➕ Adding "Climbing Stairs" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Climbing Stairs\",\"topic\":\"Dynamic Programming\",\"difficulty\":\"EASY\",\"status\":\"SOLVED\",\"description\":\"You are climbing a staircase. It takes n steps to reach the top. Each time you can climb 1 or 2 steps. In how many distinct ways can you climb to the top?\",\"link\":\"https://leetcode.com/problems/climbing-stairs/\",\"code\":\"public int climbStairs(int n) {\n    if (n <= 2) return n;\n    int[] dp = new int[n + 1];\n    dp[1] = 1;\n    dp[2] = 2;\n    for (int i = 3; i <= n; i++) {\n        dp[i] = dp[i - 1] + dp[i - 2];\n    }\n    return dp[n];\n}\",\"notes\":\"Fibonacci sequence - each step is sum of previous two\",\"mistakes\":\"Base cases: n=1 (1 way), n=2 (2 ways)\"}" >nul

echo ➕ Adding "Binary Tree Maximum Path Sum" problem...
curl -s -X POST %API_URL% ^
  -H "Content-Type: application/json" ^
  -d "{\"title\":\"Binary Tree Maximum Path Sum\",\"topic\":\"Tree\",\"difficulty\":\"HARD\",\"status\":\"NOT_SOLVED\",\"description\":\"A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. Find the maximum path sum.\",\"link\":\"https://leetcode.com/problems/binary-tree-maximum-path-sum/\",\"notes\":\"Need to consider paths that don't go through root\",\"mistakes\":\"Path can be entirely in left or right subtree\"}" >nul

echo.
echo ✅ Sample problems added successfully!
echo.
echo 🎉 Your DSA Tracker now has sample data!
echo.
echo 🌐 Open http://localhost:8080 to see your problems in the beautiful UI
echo.
echo Sample data includes:
echo • 2 Easy problems (solved)
echo • 1 Medium problem (needs revision)
echo • 1 Hard problem (not solved)
echo.
pause