import App from "./App";
import BoardGameDetailsPage from "./Pages/BoardGameDetailsPage";
import BoardGamePage from "./Pages/BoardGamesPage";

const routes = [
  {
    path: "/",
    element: <App />
  },
  {
    path: "/board_games",
    element: <BoardGamePage />
  },
  {
    path: "/board_games/:index",
    element: <BoardGameDetailsPage />
  }
]

export default routes
