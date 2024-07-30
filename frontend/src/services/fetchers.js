const urlBoardGames = "http://localhost:9292/board_games/"
const urlLogin = "http://localhost:9292/login"

const getAllBoardGames = () => {
  return fetch(urlBoardGames).then(resp => resp.json())
}

const getBoardGameData = (id) => {
  return fetch(urlBoardGames + id).then(resp => resp.json())
}

const loginUser = (username, password) => {
  return fetch(urlLogin, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ username, password }),
  }).then(resp => resp.json())
}


export { getAllBoardGames, getBoardGameData, loginUser }
