import React, { useState, useEffect, createContext } from 'react';
import { getProfileById } from '../pages/api/profiles';

export const AuthContext = createContext({});

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState();
  const [userProfile, setUserProfile] = useState();
  const [isLoggedIn, setIsLoggedIn] = useState(false);

 useEffect( () => {
   const tokenValidation = async () => {
    const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/validate_token`, {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('_fpvhive_token')}`
      },
    })

    if(response.status == 200) {
      const data = await response.json()
      
      setUser(data.user)
      setIsLoggedIn(true)
    }
   }

   tokenValidation()
 },[isLoggedIn])

  return (
    <AuthContext.Provider value={{ user, setUser, userProfile, setUserProfile, isLoggedIn, setIsLoggedIn }}>
      {children}
    </AuthContext.Provider>);

}

export default AuthProvider;