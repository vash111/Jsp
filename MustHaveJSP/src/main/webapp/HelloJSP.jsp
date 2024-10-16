<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>틱택토 게임</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .board {
            display: grid;
            grid-template-columns: repeat(3, 100px);
            grid-gap: 5px;
            margin: 20px auto;
        }
        .cell {
            width: 100px;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            border: 1px solid #000;
            cursor: pointer;
        }
        .winner {
            color: red;
        }
    </style>
    <script>
        let currentPlayer = 'X';
        let board = ['', '', '', '', '', '', '', '', ''];
        let gameOver = false;

        function handleClick(index) {
            if (board[index] !== '' || gameOver) return;

            // 사용자 턴 처리
            board[index] = currentPlayer;
            document.getElementById('cell-' + index).innerText = currentPlayer;

            if (checkWinner()) {
                document.getElementById('message').innerText = currentPlayer + ' 승리!';
                gameOver = true;
                return;
            } else if (board.every(cell => cell !== '')) {
                document.getElementById('message').innerText = '무승부!';
                gameOver = true;
                return;
            }

            // 컴퓨터 턴으로 변경
            currentPlayer = 'O'; 
            computerMove();
        }

        function computerMove() {
            // 우선 플레이어의 승리를 막기 위해 체크
            for (let i = 0; i < board.length; i++) {
                if (board[i] === '') {
                    board[i] = 'O'; // 가상의 컴퓨터 턴
                    if (checkWinner()) {
                        document.getElementById('cell-' + i).innerText = 'O';
                        document.getElementById('message').innerText = 'O 승리!';
                        gameOver = true;
                        return;
                    }
                    board[i] = ''; // 원래 상태로 되돌리기
                }
            }

            // 플레이어가 승리할 수 있는 위치를 막기
            for (let i = 0; i < board.length; i++) {
                if (board[i] === '') {
                    board[i] = 'X'; // 플레이어의 마크로 체크
                    if (checkWinner()) {
                        board[i] = 'O'; // 승리할 수 있는 위치에 둠
                        document.getElementById('cell-' + i).innerText = 'O';
                        if (checkWinner()) {
                            document.getElementById('message').innerText = 'O 승리!';
                            gameOver = true;
                        }
                        return; // 승리 방지를 위해 차례를 진행
                    }
                    board[i] = ''; // 원래 상태로 되돌리기
                }
            }

            // 빈 칸 중 하나를 랜덤으로 선택
            let availableCells = board.map((cell, index) => cell === '' ? index : null).filter(cell => cell !== null);
            if (availableCells.length > 0) {
                const randomIndex = Math.floor(Math.random() * availableCells.length);
                const computerIndex = availableCells[randomIndex];

                board[computerIndex] = 'O';
                document.getElementById('cell-' + computerIndex).innerText = 'O';

                if (checkWinner()) {
                    document.getElementById('message').innerText = 'O 승리!';
                    gameOver = true;
                } else if (board.every(cell => cell !== '')) {
                    document.getElementById('message').innerText = '무승부!';
                    gameOver = true;
                } else {
                    currentPlayer = 'X'; // 사용자 턴으로 변경
                }
            }
        }

        function checkWinner() {
            const winningCombinations = [
                [0, 1, 2], [3, 4, 5], [6, 7, 8],
                [0, 3, 6], [1, 4, 7], [2, 5, 8],
                [0, 4, 8], [2, 4, 6]
            ];
            return winningCombinations.some(combination => {
                const [a, b, c] = combination;
                return board[a] && board[a] === board[b] && board[a] === board[c];
            });
        }

        function resetGame() {
            board = ['', '', '', '', '', '', '', '', ''];
            gameOver = false;
            currentPlayer = 'X';
            document.getElementById('message').innerText = '';
            for (let i = 0; i < 9; i++) {
                document.getElementById('cell-' + i).innerText = '';
            }
        }
    </script>
</head>
<body>
    <h1>틱택토 게임</h1>
    <div class="board">
        <div class="cell" id="cell-0" onclick="handleClick(0)"></div>
        <div class="cell" id="cell-1" onclick="handleClick(1)"></div>
        <div class="cell" id="cell-2" onclick="handleClick(2)"></div>
        <div class="cell" id="cell-3" onclick="handleClick(3)"></div>
        <div class="cell" id="cell-4" onclick="handleClick(4)"></div>
        <div class="cell" id="cell-5" onclick="handleClick(5)"></div>
        <div class="cell" id="cell-6" onclick="handleClick(6)"></div>
        <div class="cell" id="cell-7" onclick="handleClick(7)"></div>
        <div class="cell" id="cell-8" onclick="handleClick(8)"></div>
    </div>
    <div id="message"></div>
    <button onclick="resetGame()">게임 재시작</button>
</body>
</html>
