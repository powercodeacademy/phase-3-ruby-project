import React from "react"
import {
  CDBSidebar,
  CDBSidebarContent,
  CDBSidebarFooter,
  CDBSidebarHeader,
  CDBSidebarMenu,
  CDBSidebarMenuItem,
} from "cdbreact"
import "bootstrap-icons/font/bootstrap-icons.css"
import { NavLink } from "react-router-dom"

const Sidebar = () => {
  return (
    <div
      style={{ display: "flex", height: "100vh", overflow: "scroll initial" }}
    >
      <CDBSidebar textColor="#fff" backgroundColor="#333">
        <CDBSidebarHeader prefix={<i className="fa fa-bars fa-large"></i>}>
          <a
            href="/"
            className="text-decoration-none"
            style={{ color: "inherit" }}
          >
            Travel Planner
          </a>
        </CDBSidebarHeader>

        <CDBSidebarContent className="sidebar-content">
          <CDBSidebarMenu>
            <NavLink exact to="/" activeClassName="activeClicked">
              <CDBSidebarMenuItem icon="columns">Dashboard</CDBSidebarMenuItem>
            </NavLink>
            <NavLink
              exact
              to="/create_new_trip"
              activeClassName="activeClicked"
            >
              <CDBSidebarMenuItem icon="bi bi-pencil-square">
                Create New Trip
              </CDBSidebarMenuItem>
            </NavLink>
            <NavLink exact to="/my_travels" activeClassName="activeClicked">
              <CDBSidebarMenuItem icon="bi bi-airplane-fill">
                My Travels
              </CDBSidebarMenuItem>
            </NavLink>
            <NavLink exact to="/calendar" activeClassName="activeClicked">
              <CDBSidebarMenuItem icon="bi bi-calendar-date-fill">
                Calendar
              </CDBSidebarMenuItem>
            </NavLink>
            <NavLink exact to="/stats" activeClassName="activeClicked">
              <CDBSidebarMenuItem icon="chart-line">Stats</CDBSidebarMenuItem>
            </NavLink>
          </CDBSidebarMenu>
        </CDBSidebarContent>

        <CDBSidebarFooter style={{ textAlign: "center" }}>
          <div
            style={{
              padding: "20px 5px",
            }}
          >
            Sidebar Footer
          </div>
        </CDBSidebarFooter>
      </CDBSidebar>
    </div>
  )
}

export default Sidebar
