import App from "./App";
import BoardGameDetailsPage from "./Pages/BoardGameDetailsPage";

const routes = [
  {
    path: "/",
    element: <App />
  },
  {
    path: "/board_games/:index",
    element: <BoardGameDetailsPage />
  }
]

export default routes
