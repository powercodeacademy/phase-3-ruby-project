import App from "./App";
import BoardGameDetailsPage from "./Pages/BoardGameDetailsPage";
import BoardGamePage from "./Pages/BoardGamesPage";
import CreateUserPage from "./Pages/CreateUserPage";

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
  },
  {
    path: "/create_user",
    element: <CreateUserPage />
  }
]

export default routes
