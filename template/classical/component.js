import React, { Component } from 'react';
%PROP_TYPES_IMPORT%

%CSS_IMPORT%

class %COMPONENT_NAME% extends Component {
	%HANDLERS%
	%METHODS%
	%LIFECYCLE_METHODS%
	render() {
	const %PROPS% = this.props;
		return (
			<div>

			</div>
		);
	}
}

%PROP_TYPES_DEFINITION%
%DEFAULT_PROPS%
export default %COMPONENT_NAME%;
