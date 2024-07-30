const urlBoardGames = "http://localhost:9292/board_games/"

const getAllBoardGames = () => {
  return fetch(urlBoardGames).then(resp => resp.json())
}

const getBoardGameData = (id) => {
  return fetch(urlBoardGames + id).then(resp => resp.json())
}

export { getAllBoardGames, getBoardGameData }
