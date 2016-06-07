import React from 'react';
import { connect } from 'react-redux';
import { push } from 'react-router-redux';

class AuthenticatedContainer extends React.Component {
  componentDidMount() {
    const { dispatch, currentUser } = this.props;

    if (localStorage.getItem('phoenixAuthToken')) {
      dispatch(Actions.currentUser());
    } else {
      dispatch(push('/sign_up'));
    }
  }

  render() {
    const { currentUser, dispatch } = this.props;
  
    if (!currentUser) return false;
 
    return (
      <div className="application-container">
        <Header
          currentUser={currentUser}
          dispatch={dispatch}/>

            <div className='main-container'>
              {this.props.children}
            </div>
      </div>
    );
   }
 }


const mapStateToProps = (state) => ({
  currentUser: state.session.currentUser
});

export default connect(mapStateToProps)(AuthenticatedContainer);
