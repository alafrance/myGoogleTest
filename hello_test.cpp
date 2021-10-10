//
// Created by Alexis Lafrance on 10/8/21.
//
#include <gtest/gtest.h>

TEST(HelloTest, BasicAssertions) {
// Expect two strings not to be equal.
EXPECT_STRNE("./hello_test", "hello world");

// Expect equality.
EXPECT_EQ(7 * 6, 42);
}
