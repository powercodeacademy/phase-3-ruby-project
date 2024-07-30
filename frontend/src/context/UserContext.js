import React, { createContext, useContext, useState, useEffect } from 'react';
import { authCheck } from '../services/fetchers';

const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  useEffect(() => {
    authCheck().then(authResponse => {
      if(authResponse.success){
        setUser(authResponse.user)
      } else {
        setUser(null)
      }
    })
    .catch(error => {
      console.error('Failed to check authentication:', error);
        setUser(null);
    })
  }, [])

  return (
    <UserContext.Provider value={{ user, setUser }}>
      {children}
    </UserContext.Provider>
  );
};

export const useUser = () => useContext(UserContext);
