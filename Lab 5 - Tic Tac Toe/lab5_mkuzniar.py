"""[TIC TAC TOE]"""

from __future__ import print_function
from os import system
import random

def print_board(board):
    """[summary]

    Args:
        board ([type]): [description]
    """
    print ('TIC TAC TOE')
    print ('-----------')
    print ('   ' + board[7] + '|' + board[8] + '|' + board[9])
    print ('   -+-+-')
    print ('   ' + board[4] + '|' + board[5] + '|' + board[6])
    print ('   -+-+-')
    print ('   ' + board[1] + '|' + board[2] + '|' + board[3])
    print ('-----------')

def chceck_if_winner(board, symbol):
    """[summary]

    Args:
        board ([type]): [description]
        symbol ([type]): [description]

    Returns:
        [type]: [description]
    """
    return ((board[7] == symbol and board[8] == symbol and board[9] == symbol) or
            (board[4] == symbol and board[5] == symbol and board[6] == symbol) or
            (board[1] == symbol and board[2] == symbol and board[3] == symbol) or
            (board[7] == symbol and board[4] == symbol and board[1] == symbol) or
            (board[8] == symbol and board[5] == symbol and board[2] == symbol) or
            (board[9] == symbol and board[6] == symbol and board[3] == symbol) or
            (board[7] == symbol and board[5] == symbol and board[3] == symbol) or
            (board[9] == symbol and board[5] == symbol and board[1] == symbol))

def is_board_full(board):
    """[summary]

    Args:
        board ([type]): [description]

    Returns:
        [type]: [description]
    """
    for i in range(1, 10):
        if is_free(board, i):
            return False
    return True

def set_player_symbol():
    """[summary]

    Returns:
        [type]: [description]
    """
    symbol = input(' X or O: ').upper()

    if symbol == 'X':
        return ['X', 'O']

    return ['O', 'X']

def get_player_move(board):
    """[summary]

    Args:
        board ([type]): [description]

    Returns:
        [type]: [description]
    """
    move = ' '

    while move not in '1 2 3 4 5 6 7 8 9'.split() or not is_free(board, int(move)):
        move = input('Position [1-9]: ')

    return int(move)

def copy_board(board):
    """[summary]

    Args:
        board ([type]): [description]

    Returns:
        [type]: [description]
    """
    cp_board = []
    cp_board = board[:]

    return cp_board

def is_free(board, move):
    """[summary]

    Args:
        board ([type]): [description]
        move ([type]): [description]

    Returns:
        [type]: [description]
    """
    return board[move] == ' '

def make_move(board, symbol, move):
    """[summary]

    Args:
        board ([type]): [description]
        symbol ([type]): [description]
        move ([type]): [description]
    """
    board[move] = symbol

def random_move(board, moves_list):
    """[summary]

    Args:
        board ([type]): [description]
        moves_list ([type]): [description]

    Returns:
        [type]: [description]
    """
    posible_moves = []

    for i in moves_list:
        if is_free(board, i):
            posible_moves.append(i)

    if posible_moves:
        return random.choice(posible_moves)

    return None

def computer_move(board, comp_symbol):
    """[summary]

    Args:
        board ([type]): [description]
        comp_symbol ([type]): [description]

    Returns:
        [type]: [description]
    """
    if comp_symbol == 'X':
        plr_symbol = 'O'
    else:
        plr_symbol = 'X'

    for i in range(1, 10):
        copy = copy_board(board)
        if is_free(copy, i):
            make_move(copy, comp_symbol, i)
            if chceck_if_winner(copy, comp_symbol):
                return i

    for i in range(1, 10):
        copy = copy_board(board)
        if is_free(copy, i):
            make_move(copy, plr_symbol, i)
            if chceck_if_winner(copy, plr_symbol):
                return i

    move = random_move(board, [1, 3, 7, 9])
    if move != None:
        return move

    if is_free(board, 5):
        return 5

    return random_move(board, [2, 4, 6, 8])

while True:
    BOARD = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    PLAYER_SYMBOL, COMPUTER_SYMBOL = set_player_symbol()
    TURN = 'player'
    GAMEON = True

    _ = system('clear')

    while GAMEON:
        if TURN == 'player':
            print_board(BOARD)
            MOVE = get_player_move(BOARD)
            make_move(BOARD, PLAYER_SYMBOL, MOVE)
            _ = system('clear')

            if chceck_if_winner(BOARD, PLAYER_SYMBOL):
                print_board(BOARD)
                print('> player won')
                GAMEON = False
            else:
                if is_board_full(BOARD):
                    print_board(BOARD)
                    print('> draw')
                    break
                else:
                    TURN = 'computer'
        else:
            MOVE = computer_move(BOARD, COMPUTER_SYMBOL)
            make_move(BOARD, COMPUTER_SYMBOL, MOVE)
            _ = system('clear')

            if chceck_if_winner(BOARD, COMPUTER_SYMBOL):
                print_board(BOARD)
                print('> computer won')
                GAMEON = False
            else:
                if is_board_full(BOARD):
                    print_board(BOARD)
                    print('> draw')
                    break
                else:
                    TURN = 'player'
    break
