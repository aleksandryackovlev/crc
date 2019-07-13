import React, { Component } from 'react';
import PropTypes from 'prop-types';

import './index.css';

class Component extends Component {
  handleClick = () => {

  };

  getValues() {

  }

  setValues() {

  }

  componentDidMount() {

  }

  componentWillUnmount() {

  }

  render() {
    const {
      value,
      source,
    } = this.props;

    return (
      <div>

      </div>
    );
  }
}

Component.propTypes = {
  value: PropTypes.string,
  source: PropTypes.object.isRequired,
};

Component.defaultProps = {
  value: 'test',
};

export default Component;
