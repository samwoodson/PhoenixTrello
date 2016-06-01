import { IndexRoute, Route } from 'react-router';
import React from 'react';
import MainLayout from '../layout/main';
import RegistrationsNew from '../views/registrations/new';

export default (
  <Route component={MainLayout}>
    <Route path="/" component={RegistrationsNew} />
  </Route>
);