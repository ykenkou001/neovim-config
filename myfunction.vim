" ##################### 関数 ################################
"カーソルの次の文字列を取得（引数は取得したい文字数）
function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction

"カーソルの前の文字列を取得（引数は取得したい文字数）:
function! GetPrevString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = getline(".")[col(".")-2-i].l:str
	endfor
	return l:str
endfunction

"アルファベットかどうかを取得
function! IsAlphabet(char) abort
	let l:charIsAlphabet = (a:char =~ "\a")
	return (l:charIsAlphabet)
endfunction

"全角かどうかを取得
function! IsFullWidth(char) abort
	let l:charIsFullWidth = (a:char =~ "[^\x01-\x7E]")
	return (l:charIsFullWidth)
endfunction

"数字かどうかを取得
function! IsNum(char) abort
	let l:charIsNum = (a:char >= "0" && a:char <= "9")
	return (l:charIsNum)
endfunction

"括弧の中にいるかどうかを取得
function IsInsideParentheses(prevChar,nextChar) abort
	let l:cursorIsInsideParentheses1 = (a:prevChar == "{" && a:nextChar == "}")
	let l:cursorIsInsideParentheses2 = (a:prevChar == "[" && a:nextChar == "]")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "(" && a:nextChar == ")")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "<" && a:nextChar == ">")
	return (l:cursorIsInsideParentheses1 || l:cursorIsInsideParentheses2 || l:cursorIsInsideParentheses3)
endfunction

"括弧の入力
function! InputParentheses(parenthesis) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:parentheses = { "{": "}", "[": "]", "(": ")", "<": ">" }

	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")" || l:nextChar == ">")
	let l:nextCharIsSpace = (l:nextChar == " ")

	if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
		return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
	else
		return a:parenthesis
	endif
endfunction

"閉じ括弧の入力
function! InputCloseParenthesis(parenthesis) abort
	let l:nextChar = GetNextString(1)
	if l:nextChar == a:parenthesis
		return "\<RIGHT>"
	else
		return a:parenthesis
	endif
endfunction

"クォーテーションの入力
function! InputQuot(quot) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)

	let l:cursorIsInsideQuotes = (l:prevChar == a:quot && l:nextChar == a:quot)
	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsClosingParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")" || l:nextChar == ">")
	let l:nextCharIsSpace = (l:nextChar == " ")
	let l:prevCharIsAlphabet = IsAlphabet(l:prevChar)
	let l:prevCharIsFullWidth = IsFullWidth(l:prevChar)
	let l:prevCharIsNum = IsNum(l:prevChar)
	let l:prevCharIsQuot = (l:prevChar == "\'" || l:prevChar == "\"" || l:prevChar == "\`")

	if l:cursorIsInsideQuotes
		return "\<RIGHT>"
	elseif l:prevCharIsAlphabet || l:prevCharIsNum || l:prevCharIsFullWidth || l:prevCharIsQuot
		return a:quot
	elseif l:nextCharIsEmpty || l:nextCharIsClosingParenthesis || l:nextCharIsSpace
		return a:quot.a:quot."\<LEFT>"
	else
		return a:quot
	endif
endfunction

"改行の入力
function! InputCR() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<CR>\<ESC>\<S-o>"
	else
		return "\<CR>"
	endif
endfunction

"スペースキーの入力
function! InputSpace() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<Space>\<Space>\<LEFT>"
	else
		return "\<Space>"
	endif
endfunction

"バックスペースの入力
function! InputBS() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:nextTwoString = GetNextString(2)
	let l:prevTwoString = GetPrevString(2)

	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	let l:cursorIsInsideSpace1 = (l:prevTwoString == "{ " && l:nextTwoString == " }")
	let l:cursorIsInsideSpace2 = (l:prevTwoString == "[ " && l:nextTwoString == " ]")
	let l:cursorIsInsideSpace3 = (l:prevTwoString == "( " && l:nextTwoString == " )")
	let l:cursorIsInsideSpace3 = (l:prevTwoString == "< " && l:nextTwoString == " >")
	let l:cursorIsInsideSpace = (l:cursorIsInsideSpace1 || l:cursorIsInsideSpace2 || l:cursorIsInsideSpace3)

	let l:existsQuot = (l:prevChar == "'" && l:nextChar == "'")
	let l:existsDoubleQuot = (l:prevChar == "\"" && l:nextChar == "\"")

	if l:cursorIsInsideParentheses || l:cursorIsInsideSpace || l:existsQuot || l:existsDoubleQuot
		return "\<BS>\<RIGHT>\<BS>"
	else
		return "\<BS>"
	endif
endfunction
