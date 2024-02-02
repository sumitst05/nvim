local M = {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
}

function M.config()
	local luasnip = require("luasnip")
	local snippet = luasnip.snippet
	local insert = luasnip.insert_node
	local fmt = require("luasnip.extras.fmt").fmt

	luasnip.config.set_config({
		history = true,
		enable_autosnippets = true,
	})

	luasnip.add_snippets("cpp", {
		snippet(
			"cc",
			fmt(
				[[
				#include <bits/stdc++.h>
				using namespace std;

				#define ll long long
				#define ld long double

				void solve() {{
					{}
				}}

				int main() {{
				  ios::sync_with_stdio(0);
					cin.tie(0);

					ll t;
					cin >> t;

					while(t--) {{
					  solve();
					}}

					return 0;
				}}
				]],
				{
					insert(1),
				}
			)
		),
	})

	luasnip.add_snippets("go", {
		snippet(
			"cc",
			fmt(
				[[
				package main

				import (
					"fmt"
				)

				func solve() {{
					{}
				}}

				func main() {{
					var t int
					fmt.Scanf("%v", &t)

					for t > 0 {{
						solve()
						t--
					}}
				}}
				]],
				{
					insert(1),
				}
			)
		),
	})

	luasnip.add_snippets("java", {
		snippet(
			"cc",
			fmt(
				[[
				import java.io.*;
				import java.util.*;

				class Test {{
					public static void main(String[] args) {{
						FastScanner sc = new FastScanner();
						PrintWriter out = new PrintWriter(System.out);
						int T = sc.nextInt();
						while (T-- > 0) {{
							{}
						}}
						out.close();
					}}

					static class FastScanner {{
						BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
						StringTokenizer st = new StringTokenizer("");

						String next() {{
							while (!st.hasMoreTokens())
								try {{
									st = new StringTokenizer(br.readLine());
								}} catch (IOException e) {{
									e.printStackTrace();
								}}
							return st.nextToken();
						}}

						int nextInt() {{ return Integer.parseInt(next()); }}

						long nextLong() {{ return Long.parseLong(next()); }}

						double nextDouble() {{ return Double.parseDouble(next()); }}

						boolean nextBoolean() {{ return Boolean.parseBoolean(next()); }}
					}}
				}}
				]],
				{
					insert(1),
				}
			)
		),
	})

	luasnip.add_snippets("python", {
		snippet(
			"cc",
			fmt(
				[[
				def main():
					{}

				if __name__ == "__main__":
					t = int(input())
					for _ in range(t):
						main()

				]],
				{
					insert(0),
				}
			)
		),
	})
end

return M
